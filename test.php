<?php

$connectionString = "cb:8091";
$options = new \Couchbase\ClusterOptions();
$options->credentials("Administrator", "password");
$cluster = new \Couchbase\Cluster($connectionString, $options);

$bucket = $cluster->bucket("default");
$col = $bucket->defaultCollection();

$options = new Couchbase\InsertOptions();
$options->expiry(5);
$result = $col->insert("test", '', $options);

$result = $col->get("test");
var_dump($result->content());
