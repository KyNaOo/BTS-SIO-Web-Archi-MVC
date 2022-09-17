<?php

namespace Quizz\Model;
use Quizz\Core\Service\DatabaseService;
use Quizz\Entity\Question;

class QuestionModel
{
    private $bdd;

    public function __construct()
    {
        $this->bdd = DatabaseService::getConnect();
    }

    public function getFechAll()
    {
        $requete = $this->bdd->prepare('SELECT * FROM question');
        $requete->execute();
        $tabQuestion = [];

        foreach ($requete->fetchAll() as $value)
        {
            $question = new Question();
            $question->setIdQuestion($value["idQuestion"]);
            $question->setLibelleQuestion($value["libelleQuestion"]);
            $tabQuestion[] = $question;
        }

        return $tabQuestion;
    }

    public function getFechId(int $id)
    {
        $requete = $this->bdd->prepare('SELECT * FROM question where idQuestion = ' . $id);
        $requete->execute();
        $result = $requete->fetch();

        $question = new Question();
        $question->setIdQuestion($result["idQuestion"]);
        $question->setLibelleQuestion($result["libelleQuestion"]);

        return  $question;
    }
}