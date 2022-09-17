<?php

namespace Quizz\Controller\Etudiant;

use Quizz\Core\Controller\ControllerInterface;
use Quizz\Model\EtudiantModel;
use Quizz\Service\TwigService;

class EtudiantController implements ControllerInterface
{
    public function outputEvent()
    {
        $twig = TwigService::getEnvironment();
        echo $twig->render('etudiant/ajouteEtudiant.html.twig'
        );
        if(isset($_POST['submit'])){
            $nom=htmlentities(trim($_POST['nom']));
            $prenom=htmlentities(trim($_POST['prenom']));
            $pseudo=htmlentities(trim($_POST['pseudo']));
            $email=htmlentities(trim($_POST['email']));
            $mdp=htmlentities(trim($_POST['mdp']));
            if($nom&&$prenom&&$pseudo&&$email&&$mdp){
                if(filter_var($email,FILTER_VALIDATE_EMAIL)){
                    $mdp=sha1($mdp);
                    $etudiantModel = NEW EtudiantModel();
                    $etudiantModel->AddEtudiant($pseudo,$mdp,$nom,$prenom,$email);
                }
            }
        }
    }

    public function inputRequest(array $tabInput)
    {
        // TODO: Implement inputRequest() method.
    }
}