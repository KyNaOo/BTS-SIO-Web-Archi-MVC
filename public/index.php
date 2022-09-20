<?php
require __DIR__ . '/../vendor/autoload.php';

use Dotenv\Dotenv;
use Quizz\Core\Controller\FastRouteCore;

// Gestion des fichiers environnement
$dotenv = Dotenv::createImmutable(__DIR__ . "/../");
$dotenv->load();

// Couche Controller
$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $route) {
    $route->addRoute('GET', '/', 'Quizz\Controller\HomeController');
    $route->addRoute('GET', '/lister', 'Quizz\Controller\Questionnaire\ListController');
    $route->addRoute('GET', '/detail/{id:\d+}', 'Quizz\Controller\Questionnaire\ViewController');
    $route->addRoute('GET','/bonjour/{name:\w+}','Quizz\Controller\HelloWorld\HelloWorldController');
    $route->addRoute('GET','/question/{id:\d+}','Quizz\Controller\Question\ListController');
    $route->addRoute(['GET','POST'],'/etudiant','Quizz\Controller\Etudiant\EtudiantController');
    $route->addRoute(['GET','POST'],'/etudiant/{id:\d+}','Quizz\Controller\Action\ModifierController');
    $route->addRoute(['GET','POST'],'/etudiant/ajouter','Quizz\Controller\Action\AjouterController');
});
// Dispatcher -> Couche view
echo FastRouteCore::getDispatcher($dispatcher);

