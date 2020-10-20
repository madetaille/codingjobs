Create an `estimations` database ("devis") and import the file `estimations.sql`.

Select, in SQL, the following information :

1. 
    SELECT estimate.reference
    FROM estimate
    WHERE estimate.created_at NOT LIKE "2015-%"
    AND estimate.status LIKE "Payé";

2. 
    SELECT *
    FROM estimate
    WHERE status <> "Validé";

3. 
    SELECT estimate.reference, estimate.status, client.lastname, client.firstname
    FROM estimate, client
    WHERE estimate.id_client = client.id

4. 
    SELECT estimate.reference, estimate.status, client.lastname, client.firstname
    FROM estimate, client
    WHERE estimate.id_client = client.id
    AND client.lastname = "Abagnale";

5. 
    SELECT article.name, article.price, article_estimate.quantity
    FROM article, article_estimate, estimate
    WHERE estimate.id = article_estimate.id_estimate
    AND article_estimate.id_article = article.id
    AND estimate.reference = "FR2580"

Bonus

6. 
    SELECT article.name, article.price, article_estimate.quantity
    FROM article, article_estimate, estimate, client
    WHERE estimate.id = article_estimate.id_estimate
    AND article_estimate.id_article = article.id
    AND client.id = estimate.id_client
    AND client.lastname = "Abagnale"
    AND client.firstname = "Daniel"

7. 
    SELECT article.name
    FROM article_estimate, estimate, article
    WHERE article_estimate.id_estimate = estimate.id
    AND article_estimate.id_article = article.id
    AND estimate.created_at < "2016-10-01"

8. 
    SELECT article.name
    FROM article
    JOIN article_estimate ON article_estimate.id_article = article.id
    JOIN estimate ON article_estimate.id_estimate = estimate.id
    WHERE estimate.discount <> 0;

9. 
    SELECT estimate.discount
    FROM article_estimate, estimate, article, client
    WHERE article_estimate.id_estimate = estimate.id
    AND article_estimate.id_article = article.id
    AND estimate.id_client = client.id
    AND article.name = "Accordéon"
    AND client.lastname = "Malkovich";

