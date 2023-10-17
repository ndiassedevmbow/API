<?php  
// CONNECTION A LA BASE DE DONNEE
function conn()
{
    return new PDO("mysql:host=localhost; dbname=gestCom", "root", "");
}

// FONCTION POUR AFFICHER TOUT LES CLIENTS
function getAllClient()
{
    print("Affichage de tout les clients");
    $recupConn = conn();

    if($recupConn)
    {
        $req = $recupConn->prepare("SELECT * FROM CLIENT");
        $req->execute();

        $clients = $req->fetchAll(PDO::FETCH_ASSOC);

        $req->closeCursor();
        send_JSON($clients);
    }
}

// FONCTION POUR AFFICHER TOUT LES CLIENTS QUI ONT PASSE COMMANDE specifique
function getAllClientSpecifiq($specifiq)
{
    print("Affichage de tout les clients qui ont passe une commande specifique");
    $recupConn = conn();

    if($recupConn)
    {
        $req = $recupConn->prepare("SELECT * FROM CLIENT AS CL, COMMANDE AS CM, ARTICLE AS ART, LIGNECOMMANDE AS LC WHERE CL.idClient = CM.idClient AND CM.idCommande = LC.idCommande AND ART.idArticle = LC.idArticle AND ART.description = :specifiq");
        $req->execute(["specifiq" => $specifiq]);

        $clients = $req->fetchAll(PDO::FETCH_ASSOC);
        $req->closeCursor();

        send_JSON($clients);
    }

}

// FONCTION POUR AFFICHER TOUT ARTICLES
function getAllArticles()
{
    print("Affichage de tout les articles");
    $recupConn = conn();

    if($recupConn)
    {
        $req = $recupConn->prepare("SELECT * FROM ARTICLE");
        $req->execute();

        $articles = $req->fetchAll(PDO::FETCH_ASSOC);
        $req->closeCursor();

        send_JSON($articles);
    }
}

// FONCTION POUR AFFICHER TOUT LES COMMANDES
function getAllCommandes()
{
    print("Affichage de tout les commandes");
    $recupConn = conn();

    if($recupConn)
    {
        $req = $recupConn->prepare("SELECT * FROM COMMANDE");
        $req->execute();

        $commandes = $req->fetchAll(PDO::FETCH_ASSOC);
        $req->closeCursor();

        send_JSON($commandes);
    }
}



function send_JSON($infos)
{
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json");
    echo json_encode($infos, JSON_UNESCAPED_UNICODE);
}
?>