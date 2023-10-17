<?php
require_once 'api.php';

try {
    if (!empty($_GET["porte"])) {
        $url = explode("/", filter_var($_GET["porte"]), FILTER_SANITIZE_URL);
        switch ($url[0]) {
            case "clients":
                if (empty($url[1])) {
                    getAllClient();
                } else {
                    getAllClientSpecifiq($url[1]);
                }
                break;

            case "articles":
                getAllArticles();
                break;

            case "commandes":
                getAllCommandes();
                break;

            default:
                throw new Exception("Rien n'a été écrit ou c'est erroné");
        }
    } else {
        throw new Exception("Aucune porte n'a été renseignée");
    }
} catch (Exception $e) {
    $erreur = [
        "message" => $e->getMessage(),
        "code" => $e->getCode()
    ];
    send_JSON($erreur);
}
?>