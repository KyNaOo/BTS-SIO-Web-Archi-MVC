<?php

namespace Quizz\Model;
use Quizz\Core\Service\DatabaseService;
use Quizz\Entity\Etudiant;

class EtudiantModel
{
    private $bdd;

    public function __construct()
    {
        $this->bdd = DatabaseService::getConnect();
    }

    public function AddEtudiant(string $log , string $mdp, string $lastname,string $firstname,string $mail){
        $requete = $this->bdd->prepare("insert into etudiants (login, motDePasse, nom, prenom, email) VALUES ('".$log."','".$mdp."','".$lastname."','".$firstname."','".$mail."')");
        $requete->execute();
    }
}