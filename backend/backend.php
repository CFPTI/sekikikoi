<?php

/**
 * Date : 15.03.2019
 */
require_once("EDatabase.php");
header('Content-type: application/json');

$methodeName = null;
$titleName = 'étoile';
$titleId = 1; //make getter

/**
 * Description : Get the name of the methode to call and the title to search
 */
if (isset($_GET["methodName"])) {
    $methodeName = $_GET["methodName"];

    // if(isset($_GET["title"])){
    //  $titleName = $_GET["title"];
    if ($methodeName == "getTitleByName") {
        echo getTitleByName($titleName);
    }
    //}

    if ($methodeName == "getAllRefsByTitleId") {
        echo getAllRefsByTitleId($titleId);
    }

    if ($methodeName == "getReferencesForTitle") {
        $idMedia = $_GET["idMedia"];
        $idCategory = $_GET["idCategory"];
        echo getReferencesForTitle($idMedia, $idCategory);
    }
}

/**
 * @name : the name of the title
 * return :  Main informaitons of the title
 * return-type: json
 */
function getTitleByName($name) {
    $pdoStmt = EDatabase::prepare("
        SELECT *
        FROM `media`
        WHERE titre LIKE :name
        ");
    $name = "%" . $name . "%";
    echo "test";
    $pdoStmt->bindParam(':name', $name, PDO::PARAM_STR);

    $pdoStmt->execute();
    $mainInfo = $pdoStmt->fetchAll(PDO::FETCH_ASSOC)[0];

    return json_encode($mainInfo);
}

/* * *
 * @param $idTitle id of the title we want to have the refs
 * @return string json encoded table containing the sum of the references found for this title
 */

function getAllRefsByTitleId($idMedia) {

    $pdoStmt = EDatabase::prepare("
    SELECT COUNT(category.id_category) AS number, category.name
    FROM `reference`, `media`, `category` 
    WHERE id_media_ref = id_media
    AND media.id_category = category.id_category
    AND `id_media_base` = :idMedia
    GROUP BY (category.id_category)
   ");
    $pdoStmt->bindParam(':idMedia', $idMedia, PDO::PARAM_INT);
    $pdoStmt->execute();
    $refArray = $pdoStmt->fetchAll(PDO::FETCH_ASSOC);
    return json_encode($refArray);
}

function getReferencesForTitle($idMedia, $idCategory) {
    $pdoStmt = EDatabase::prepare("Select * from reference, media, category , type_reference where 
  id_media_ref = id_media
  AND media.id_category = category.id_category 
    AND reference.id_type_reference = type_reference.id_type_reference
  AND id_media_base = :idMedia
  AND category.id_category = :idCategory");

    $pdoStmt->bindParam(':idMedia', $idMedia, PDO::PARAM_INT);
    $pdoStmt->bindParam(':idCategory', $idCategory, PDO::PARAM_INT);
    $pdoStmt->execute();
    $refArrays = array();
    $refArrays = $pdoStmt->fetchAll(PDO::FETCH_ASSOC);

    return json_encode($refArrays);
}
