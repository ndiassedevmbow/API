<?php
$json_content = file_get_contents("http://localhost/TECH_PHP_FRAM/PROJET/API_COM/Api/articles/");
$articles = json_decode($json_content);

if ($articles === null) {
    echo "NULL.";
    exit;
}
ob_start();
?>

<main class="flex-shrink-0">
    <div class="container">
        <h1 class="mt-5">Articles</h1>

        <a href="addClient.php" class="btn btn-primary" style="float: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16"><path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/></svg>
        </a>

        <table id="myTable" class="display">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Description</th>
                    <th>Prix Unitaire</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($articles as $art): ?>
                <tr>
                    <td><?php echo $art->idArticles; ?></td>
                    <td><?php echo $art->description; ?></td>
                    <td><?php echo $art->pu; ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</main>

<?php
$content = ob_get_clean();
require_once 'template.php';
?>
