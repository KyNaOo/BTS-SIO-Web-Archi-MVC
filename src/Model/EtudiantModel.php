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

    public function  delEtudiant(int $id)
    {
        $requete = $this->bdd->prepare("delete from etudiants where idEtudiant ={$id}");
        $requete->execute();
    }
    public function ModifEtudiant(int $idEd, string $nom, string $prenom, string $log, string $mdp, string $email)
    {
        $requete = $this->bdd->prepare("update etudiants set login ='{$log}',motDePasse='{$mdp}',nom='{$nom}',prenom='{$prenom}',email='{$email}'
        where idEtudiant='{$idEd}'");
        $requete->execute();
    }
    public function ModifPasMDP(int $idEd, string $nom, string $prenom, string $log,string $email)
    {
        $requete = $this->bdd->prepare("update etudiants set login ='{$log}',nom='{$nom}',prenom='{$prenom}',email='{$email}'
        where idEtudiant='{$idEd}'");
        $requete->execute();
    }
    public function getFetchallEtudiant()
    {
        $requete = $this->bdd->prepare("SELECT * FROM etudiants");
        $requete->execute();
        $tabEtudiant = [];
        foreach ($requete->fetchAll() as $value) {
            $etudiant = new Etudiant();
            $etudiant->setIdEtudiant($value['idEtudiant']);
            $etudiant->setPrenom($value['prenom']);
            $etudiant->setEmail($value['email']);
            $etudiant->setLogin($value['login']);
            $etudiant->setNom($value['nom']);
            $etudiant->setMotDePasse($value['motDePasse']);
            $tabEtudiant[] = $etudiant;
        }

        return $tabEtudiant;
    }
    public function getFetchIdEtudiant(int $id)
    {
        $requete = $this->bdd->prepare("SELECT * FROM etudiants where idEtudiant=" . $id);
        $requete->execute();
        $result=$requete->fetch();

        $etudiant = new Etudiant();
        $etudiant->setIdEtudiant($result['idEtudiant']);
        $etudiant->setPrenom($result['prenom']);
        $etudiant->setEmail($result['email']);
        $etudiant->setLogin($result['login']);
        $etudiant->setNom($result['nom']);
        $etudiant->setMotDePasse($result['motDePasse']);

        return $etudiant;
    }

}