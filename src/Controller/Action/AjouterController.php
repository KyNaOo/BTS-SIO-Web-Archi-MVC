<?php

namespace Quizz\Controller\Action;

use Quizz\Core\Controller\ControllerInterface;
use Quizz\Entity\Etudiant;
use Quizz\Model\EtudiantModel;
use Quizz\Service\TwigService;

class AjouterController implements ControllerInterface
{
    public function inputRequest(array $tabInput)
    {
        // TODO: Implement inputRequest() method.
    }

    public function outputEvent()
    {
        if(isset($_POST['submit'])){
            $nom=htmlentities(trim($_POST['nom']));
            $prenom=htmlentities(trim($_POST['prenom']));
            $pseudo=htmlentities(trim($_POST['pseudo']));
            $email=htmlentities(trim($_POST['email']));
            $mdp=htmlentities(trim($_POST['mdp']));
            $message="";
                    if($nom&&$prenom&&$pseudo&&$email&&$mdp){
                        if(filter_var($email,FILTER_VALIDATE_EMAIL)){
                            $mdp=sha1($mdp);
                            $etudiantModel = NEW EtudiantModel();
                            $etudiantModel->AddEtudiant($pseudo,$mdp,$nom,$prenom,$email);
                            header('Location:/etudiant');
                        }else{
                            $message = "MAIL INVALIDE !!!";
                        }
                    }
        }
        $twig = TwigService::getEnvironment();
        echo $twig->render('etudiant/ajouteEtudiant.html.twig',['message'=> $message]
        );
    }

}