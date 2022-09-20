<?php

namespace Quizz\Controller\Action;

use Quizz\Core\Controller\ControllerInterface;
use Quizz\Core\View\TwigCore;
use Quizz\Model\EtudiantModel;

class ModifierController implements ControllerInterface
{
    private $idEd;
    public function inputRequest(array $tabInput)
    {
        if(isset($tabInput["VARS"]["id"])){
            $this->idEd = $tabInput["VARS"]["id"];
            if(isset($_POST['supp'])){
                $id = $this->idEd;
                $etudiantModel= new EtudiantModel();
                $etudiantModel->delEtudiant($id);
                header('Location:/etudiant');
            }
            if(isset($_POST['submit'])){
                $id=$this->idEd;
                $nom=htmlentities(trim($_POST['nom']));
                $prenom=htmlentities(trim($_POST['prenom']));
                $pseudo=htmlentities(trim($_POST['pseudo']));
                $email=htmlentities(trim($_POST['email']));
                $mdp=htmlentities(trim($_POST['mdp']));
                if(empty($mdp)){
                    $mdpNormal = new EtudiantModel();
                    $mdpNormal->ModifPasMDP($id,$nom,$prenom,$pseudo,$email);
                    header('Location:/etudiant');
                }else{
                    $mdp=sha1($mdp);
                    $etudiantModel= new EtudiantModel();
                    $etudiantModel->ModifEtudiant($id,$nom,$prenom,$pseudo,$mdp,$email);
                    header('Location:/etudiant');
                }
            }
        }
    }
    public function outputEvent()
    {
        $etudiantModel = new EtudiantModel();
        return TwigCore::getEnvironment()->render(
            'etudiant/modifEtudiant.html.twig',[
            'leId'=>$etudiantModel->getFetchIdEtudiant($this->idEd)
        ]);
    }
}