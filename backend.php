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

getTitleByName();