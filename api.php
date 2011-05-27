<?php

$ret = 'Ext.ns("Ext.app");
Ext.app.REMOTING_API = {
    "url":"ext.php",
    "type":"remoting",
    "actions":{
		"Ucenik": [{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
		"Mjesto":[{ "name":"listMjesto", "len":0 }],
        "Menu": [{"name":"side", "len":0}],
        "Razred": [{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "SkolskaGodina": [{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Ucitelj":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Drzava":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Mjesto":[
            {
                "name": "getAll",
                "len":0
            }, {
                "name": "save",
                "len":0,
                "formHandler": true
            }, {
                name: "delete",
                len: 1
            }
        ],
        "NacionalnaManjina":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "NastavniPlan":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Dogadjaj":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Narodnost":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Skola":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Predmet":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "PredmetRazrednogOdjeljenja":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
		"Poteskoca":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Zanimanje":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Titula":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "KategorijaOcjena":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "SlobodnaAktivnost":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "VrstaPutnika":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "RazlogBoravista":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "PredmetnaCjelina":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Ocjena":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "DodijeljenaPoteskoca":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "NastavnaJedinica":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "MetodskaJedinica":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "NastavniSat":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "NajavaIspita":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Adresa":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Izostanak":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        
        "User": [{
            name: "getAll",
            len: 0
        },{
            name: "save",
            len: 0,
            formHandler: true
        }],
        
        "Group": [{
            name: "getAll",
            len: 0
        },{
            name: "save",
            len: 0,
            formHandler: true
        }],
        
        "Help": [{
            name: "getAll",
            len: 0
        },{
            name: "save",
            len: 0,
            formHandler: true
        }]
    }
};';

header('Content-Type: text/javascript');
echo $ret;

?>
