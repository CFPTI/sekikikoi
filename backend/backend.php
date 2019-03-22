<?php 
/**
 * Date : 15.03.2019
 */
require_once("EDatabase.php");
header('Content-type: application/json');

$methodeName = null;
$titleName = null;
$titleId = 42; //make getter


/**
 * Description : Get the name of the methode to call and the title to search
 */
if(isset($_GET["methodName"])){
    $methodeName = $_GET["methodName"];
    if(isset($_GET["title"])){
      $titleName = $_GET["title"];
      if($methodeName == "getTitleName"){
        echo getTitleByName($titleName);
      }
    }
    
    if($methodeName == "getAllRefsByTitleId"){
      echo getAllRefsByTitleId($titleId);
    }

    if($methodeName == "getReferencesForTitle"){
      
      echo getReferencesForTitle(1);
    }
}

/**
 * @name : the name of the title
 * return :  Main informaitons of the title
 * return-type: json
 */
function getTitleByName($name){
  $mainInfo = [
    "id"=>"14",
    "title"=>"Nés sous la même étoile",
    "artise"=> "Iam",
    "link"=>"https://open.spotify.com/track/66ZtqKhYSA8XyPr0aAUFsm",
    "release_date"=> "2017-05-26"
  ];

  return json_encode($mainInfo);
}

/***
 * @param $idTitle id of the title we want to have the refs
 * @return string json encoded table containing the sum of the references found for this title
 */
function getAllRefsByTitleId($idTitle){

    $pdoStmt = EDatabase::prepare("
    SELECT COUNT(id_catergory), category.name
    FROM `reference`, `media`, `category`
    WHERE id_media_ref = id_media
    AND media.id_catergory = category.id_category
    AND `id_media_base` = :idMedia
    GROUP BY (id_catergory)
   ");
   $pdoStmt->bindParam(':idMedia', $idMedia, PDO::PARAM_INT);
   $pdoStmt->execute();
   $refArray = $pdoStmt->fetchAll(PDO::FETCH_ASSOC);
   return json_encode($refArray);
  }

 function getReferencesForTitle($idMedia){
 /* $pdoStmt = EDatabase::prepare("");
  $pdoStmt->bindParam(':idMedia', $idMedia, PDO::PARAM_INT);
  $pdoStmt->execute();
 */
    /*$refArrays = array();

    $refArrays[0] = [
        "id" => "1",
        "title" => "Goldorak",
        "category" => "Cinema",
        "categoryId" => "3",
        "typeRef" => "Citation",
        "desc" => "A la fin du morceau, on peut entendre un extrait du deuxième épisode de Goldorak : une phrase prononcée par Actarus, « Mon Dieu, pourquoi ne puis-je vivre comme n'importe quel être humain ? Pourquoi mon destin est-il de ne pouvoir cesser de me battre ? ».",
        "url" => "#"
    ] ;

    $refArrays[1] = [
        "id" => "2",
        "title" => "Scarface",
        "category" => "Cinema",
        "categoryId" => "3",
        "desc" => "On entend à la toute fin du morceau la phrase « La vie de rêve ». C'est une citation de Tony Montana joué par Al Pacino dans la version française du film Scarface de Brian De Palma. Le personnage prononce cette phrase lors de sa demande d'asile politique aux États-Unis alors qu'il dépeint son quotidien à subir le pouvoir communiste de Cuba qu'il vient de quitter.",
        "typeRef" => "Citation",
        "url" => "#"
        ];

    $refArrays[2] = [
        "id" => "3",
        "title" => "Meurtre à Alcatraz",
        "category" => "Cinema",
        "categoryId" => "3",
        "typeRef" => "Sample",
        "desc" => "Le sample de ce morceau est tiré de ce film. Il aparaît à la fin du film notamment",
        "url" => "#"
    ];

return json_encode($refArray);
*/
}