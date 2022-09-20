<?php

namespace Quizz\Controller\HelloWorld;
use Quizz\Core\View\TwigCore;
use Quizz\Model\HelloWorldModel;
use Quizz\Service\TwigService;
use Quizz\Core\Controller\ControllerInterface;
class HelloWorldController implements ControllerInterface
{
    private $leName;
    public function inputRequest(array $tabInput)
    {
        if(isset($tabInput["VARS"]["name"])){
            $this->leName = $tabInput["VARS"]["name"];
        }
    }

    public function outputEvent()
    {
        return TwigCore::getEnvironment()->render(
            'questionnaire/hello.html.twig',[
                'leNom'=>$this->leName
            ]);
    }
}