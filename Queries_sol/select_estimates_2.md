1. Affichez la liste des devis en précisant, pour chaque ligne, le nom et le prénom du client
SELECT client.firstname, client.lastname, estimate.id, estimate.created_at, estimate.validated_at, estimate.status, estimate.reference, estimate.discount, estimate.id_client FROM client JOIN estimate WHERE client.id = estimate.id_client;

2. 
    SELECT article.name, article.price, article_estimate.quantity
    FROM article, estimate, article_estimate
    WHERE article.id = article_estimate.id_article
    AND article_estimate.id_estimate = estimate.id
    AND estimate.reference = "FR2580"

3. Affichez les numéros de devis destinés au client "Malkovich" (ou un autre nom)
    SELECT estimate.reference
    FROM estimate, client
    WHERE client.id = estimate.id_client
    AND client.lastname = "Malkovich"

4.
    SELECT estimate.reference
    FROM estimate, client
    WHERE client.id = estimate.id_client
    AND client.lastname = "Malkovich"
    AND estimate.status = "Brouillon";

Bonus :

5. 
    SELECT estimate.reference, client.firstname, client.lastname
    FROM estimate
    INNER JOIN client ON client.id = estimate.id_client
    WHERE estimate.status <> "Validé" 

    SELECT estimate.reference, client.firstname, client.lastname
    FROM estimate, client
    WHERE client.id = estimate.id_client
    AND estimate.status <> "Validé" 

6. 
    SELECT estimate.reference, article.name
    FROM estimate, article, client, article_estimate
    WHERE estimate.id = article_estimate.id_estimate
    AND article.id = article_estimate.id_article
    AND client.id = estimate.id_client
    AND client.lastname = "Abagnale"
    ORDER BY estimate.reference, article.name;

7. 
    SELECT client.lastname, client.firstname
    FROM estimate, client
    WHERE client.id = estimate.id_client
    AND estimate.discount > 0;
