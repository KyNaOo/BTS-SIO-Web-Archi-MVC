<?php

namespace Quizz\Controller\Question;

use Quizz\Core\Controller\ControllerInterface;
use Quizz\Core\View\TwigCore;

class ListController implements ControllerInterface
{
    public function inputRequest(array $tabInput)
    {
        // Nulle :)
    }

    public function outputEvent()
    {
        $_GET['question'];
        // Si y a pas de GET alors j'affiche tout
        return TwigCore::getEnvironment()->render(
            'question.html.twig',['question'
            ]);
    }
}