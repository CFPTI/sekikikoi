<?php

// Change l'url si c'est sur infomaniak ou pas
$online = false;
/**
 * Copier ce fichier dans le répertoire
 * /server/config
 * Le renommer config.inc.php
 * @remark Le fichier config.inc.php n'est pas synchroniser dans git
 */
// Le Type de la base de donnée
define ('DB_DBTYPE', "mysql");

// Connexion local
define("DB_HOST","127.0.0.1");
define("DB_NAME","sekikikoi");
define("DB_USER","sekikikoi_admin");
define("DB_PASS","Super");


/**
 * Retourne un objet PDO connecté à la base de données
 * @return \PDO
 */
class EDatabase {

  private static $pdoInstance;

  /**
   * @brief   Class Constructor - Créer une nouvelle connextion à la database si la connexion n'existe pas
   *          On la met en privé pour que personne puisse créer une nouvelle instance via ' = new KDatabase();'
   */
  private function __construct() {
      echo "construct";
  }

  /**
   * @brief   Comme le constructeur, on rend __clone privé pour que personne ne puisse cloner l'instance
   */
  private function __clone() {
      
  }

  /**
   * @brief   Retourne l'instance de la Database ou créer une connexion initiale
   * @return $objInstance;
   */
  public static function getInstance() {
      if (!self::$pdoInstance) {
          try {
              $dsn = DB_DBTYPE . ':host=' . DB_HOST .  ';dbname=' . DB_NAME;
              self::$pdoInstance = new PDO($dsn, DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
              self::$pdoInstance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);   
          } catch (PDOException $e) {
              echo "EDatabase Error: " . $e->getMessage();
          }
      }
      return self::$pdoInstance;
  }

# end method
  /**
   * @brief   Passes on any static calls to this class onto the singleton PDO instance
   * @param   $chrMethod      The method to call
   * @param   $arrArguments   The method's parameters
   * @return  $mix            The method's return value
   */

  final public static function __callStatic($chrMethod, $arrArguments) {
      $pdo = self::getInstance();
      return call_user_func_array(array($pdo, $chrMethod), $arrArguments);
  }

# end method
}