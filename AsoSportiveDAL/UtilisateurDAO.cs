﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AsoSportiveBO; // Référence la couche BO
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace AsoSportiveDAL
{
    public class UtilisateurDAO
    {
        private static UtilisateurDAO unUtilisateurDAO;

        // Accesseur en lecture, renvoi une instance
        public static UtilisateurDAO GetUnUtilisateurDAO()
        {
            if (unUtilisateurDAO == null)
            {
                unUtilisateurDAO = new UtilisateurDAO();
            }

            return unUtilisateurDAO;
        }

        // Cette méthode retourne une List contenant les objets Utilisateurs
        // contenus dans la table Identification
        public static List<Utilisateur> GetUtilisateurs()
        {
            int id;
            string login;
            string pass;
            Utilisateur unUtilisateur;

            // Connexion à la BD
            SqlConnection maConnexion = ConnexionBD.GetConnexionBD().GetSqlConnection();

            // Création d'une liste vide d'objets Utilisateurs
            List<Utilisateur> lesUtilisateurs = new List<Utilisateur>();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = maConnexion;
            cmd.CommandText = "SELECT * FROM ADMINISTRATEUR";

            SqlDataReader monReader = cmd.ExecuteReader();

            // Remplissage de la liste
            while (monReader.Read())
            {
                id = Int32.Parse(monReader["id_utilisateur"].ToString());

                if (monReader["id_utilisateur"] == DBNull.Value)
                {
                    login = default(string);
                    pass = default(string);
                }
                else
                {
                    login = monReader["login_utilisateur"].ToString();
                    pass = monReader["mot_de_passe_utilisateur"].ToString();
                }
                unUtilisateur = new Utilisateur(id, login, pass);
                lesUtilisateurs.Add(unUtilisateur);
            }
            // Fermeture de la connexion
            maConnexion.Close();

            return lesUtilisateurs;
        }

        // Cette méthode permet la connexion d'un utilisateur
        public static bool ConnexionUtilisateur(string login, string pass)
        {
            foreach (Utilisateur utilisateur in GetUtilisateurs()) {
                if (login == utilisateur.Login && pass == utilisateur.Pass)
                {
                    return true;
                }
            }

            return false;
        }

        // Cette méthode insert un nouvel utilisateur passé en paramètre
        // dans la BD
        public static int AjoutUtilisateur(Utilisateur unUtilisateur)
        {
            int nbEnr;

            // Connexion à la BD
            SqlConnection maConnexion = ConnexionBD.GetConnexionBD().GetSqlConnection();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = maConnexion;
            cmd.CommandText = "INSERT INTO ELEVE values('" + unUtilisateur.Login + "')";

            nbEnr = cmd.ExecuteNonQuery();

            // Fermeture de la connexion
            maConnexion.Close();

            return nbEnr;
        }

        // Cette méthode modifie un utilisateur passé en paramètre dans la BD
        public static int UpdateUtilisateur(Utilisateur unUtilisateur)
        {
            int nbEnr;

            // Connexion à la BD
            SqlConnection maConnexion = ConnexionBD.GetConnexionBD().GetSqlConnection();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = maConnexion;
            cmd.CommandText = "UPDATE ELEVE SET login_utilisateur = '" +
                unUtilisateur.Login + "' WHERE id_utilisateur = " + unUtilisateur.Id;

            nbEnr = cmd.ExecuteNonQuery();

            // Fermeture de la connexion
            maConnexion.Close();

            return nbEnr;
        }

        // Cette méthode supprime de la BD un utilisateur dont l'id est 
        // passé en paramètre
        public static int DeleteUtilisateur(int id)
        {
            int nbEnr;

            // Connexion à la BD
            SqlConnection maConnexion = ConnexionBD.GetConnexionBD().GetSqlConnection();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = maConnexion;
            cmd.CommandText = "DELETE FROM ELEVE WHERE id_utilisateur = " + id;

            nbEnr = cmd.ExecuteNonQuery();

            // Fermeture de la connexion
            maConnexion.Close();

            return nbEnr;
        }
    }
}
