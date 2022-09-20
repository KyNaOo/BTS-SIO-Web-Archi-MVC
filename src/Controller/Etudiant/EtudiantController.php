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
        // Obj connect Mysql -> Obj Questionnaire
        $etudiantModel = new EtudiantModel();

        echo $twig->render('etudiant/listEtudiant.html.twig', [
            'etudiants' => $etudiantModel->getFetchallEtudiant(),
            'value' => false
        ]);
    }

    public function inputRequest(array $tabInput)
    {
        // TODO: Implement inputRequest() method.
    }
}