<?php

$ret = 'Ext.ns("Ext.app");
Ext.app.REMOTING_API = {
    "url":"ext.php",
    "type":"remoting",
    "actions":{
		"Ucenik": [
            {
                name: "read",
                len: 1
            }, {
                name: "create",
                len: 1
            }, {
                name: "update",
                len: 1
            }, {
                name: "destroy",
                len: 1
            }
        ],
        "Menu": [
            {
                name: "read",
                len: 1
            },
            {
                name: "create",
                len: 1
            },
            {
                name: "update",
                len: 1
            },
            {
                name: "destroy",
                len: 1
            },
            {
                name: "sidemenu",
                len: 1
            }
        ],
        "Razred": [
            {
                name: "read",
                len: 1
            }, {
                name: "create",
                len: 1
            }, {
                name: "update",
                len: 1
            }, {
                name: "destroy",
                len: 1
            }
        ],
        "SkolskaGodina": [{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Ucitelj":[{"name":"getAll", "len":0}, { "name": "save", "len":0, "formHandler": true}],
        "Drzava":[
            {
                name: "getAll",
                len: 1
            }, {
                name: "find",
                len: 1
            }, {
                name: "save",
                len: 0,
                formHandler: true
            }
        ],
        "Mjesto":[
            {
                "name": "getAll",
                "len":1
            }, {
                name: "save",
                len: 1,
            }, {
                name: "del",
                len: 1
            }, {
                name: "update",
                len: 1
            }
        ],
        "NacionalnaManjina":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "NastavniPlan":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Dogadjaj":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Narodnost":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Skola":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Predmet":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "PredmetRazrednogOdjeljenja":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
		"Poteskoca":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Zanimanje":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Titula":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "KategorijaOcjena":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "SlobodnaAktivnost":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "VrstaPutnika":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "RazlogBoravista":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "PredmetnaCjelina":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Ocjena":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "DodijeljenaPoteskoca":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "NastavnaJedinica":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "MetodskaJedinica":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "NastavniSat":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "NajavaIspita":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Adresa":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "Izostanak":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        "UcenikRazred":[{"name":"getAll", "len":1}, { "name": "save", "len":0, "formHandler": true}],
        
        "User": [{
            name: "getAll",
            len: 0
        },{
            name: "save",
            len: 0,
            formHandler: true
        },{
            name: "delete",
            len: 1
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
        }],
        
        "Tip": [
            {
                name: "read",
                len: 1
            }
        ]
    }
};';

header('Content-Type: text/javascript');
echo $ret;

?>
