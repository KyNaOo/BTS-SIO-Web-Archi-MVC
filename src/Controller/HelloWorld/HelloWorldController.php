<?php

namespace Quizz\Controller\HelloWorld;
use Quizz\Model\HelloWorldModel;
use Quizz\Service\TwigService;
use Quizz\Core\Controller\ControllerInterface;
class HelloWorldController implements ControllerInterface
{
    public function inputRequest(array $tabInput)
    {
        // TODO: Implement inputRequest() method.
    }

    public function outputEvent()
    {
        $twig = TwigService::getEnvironment();
        // Obj connect Mysql -> Obj Questionnaire
        $helloWorld = new HelloWorldModel();

        echo $twig->render('hello.html.twig'
        );
    }

}