<?php 
/**
 * Date : 15.03.2019
 */
header('Content-type: application/json');


/**
 * @name : the name of the title
 * return :  Main informaitons of the title
 * return-type: json
 */
function getTitleByName($name){
  $array = [
    "id"=>"14",
    "name"=>"Nés sous la même étoile",
    "artise"=> "Iam",
    "link"=>"https://open.spotify.com/track/66ZtqKhYSA8XyPr0aAUFsm",
    "release_date"=> "2017-05-26"
  ];

  return($array);
}

/***
 * @param $idTitle id of the title we want to have the refs
 * @return string json encoded table containing the sum of the references found for this title
 */
function getAllRefsByTitleId($idTitle){

    $refArray = [
        "Musique" => "11",
        "Cinéma" => "6",
        "Politique" => "2",
        "Autre" => ""
    ];

    return json_encode($refArray);
    }

 function getReferencesForTitle($idTitle, $idCategory){
    $refArrays = array();

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

}