$infras = ("sql-data", "nosql-data", "rabbitmq", "keystore-data", "basket-data")
$charts = ("eshop-common", "basket-api","catalog-api", "identity-api", "mobileshoppingagg","ordering-api","ordering-backgroundtasks","ordering-signalrhub", "payment-api", "webmvc", "webshoppingagg", "webspa", "webstatus", "webhooks-api", "webhooks-web")
$gateways = ("apigwms", "apigwws")

foreach ($infra in $infras) {
    Write-Host "Installing infrastructure: $infra" -ForegroundColor Green
    kubectl apply -f "$infra.yaml"
}

foreach ($chart in $charts) {
    Write-Host "Installing chart: $chart" -ForegroundColor Green
    kubectl apply -f "$chart.yaml"
}


foreach ($chart in $gateways) {
    Write-Host "Installing Api Gateway Chart: $chart" -ForegroundColor Green
    kubectl apply -f "$chart.yaml"
}