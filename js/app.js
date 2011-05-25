// Register namespace
Ext.ns('Athene'); // ns is shorthand for namespace

// Enable the loader
Ext.Loader.setConfig({
    enabled: true,
    paths: {
        'Ext': './js/ext/src'
    }
});

// I'm not sure if this is really needed
// since it was taken from a tutorial that was written for ext 2.0
// Reference: http://blog.extjs.eu/know-how/writing-a-big-application-in-ext/
Ext.BLANK_IMAGE_URL = './img/s.gif';

// Let's create our application
Ext.application({
    name: 'Athene',
    
    appFolder: 'js/Athene',
    
    controllers: [
	'Main', // main controller, handles actions on viewport
        'Menu',
        'Razred',
        'SkolskaGodina',
        'Ucenik',
        'Ucitelj',
	'Drzava',
	'Mjesto',
	'NacionalnaManjina',
	'NastavniPlan',
	'Dogadjaj',
	'Narodnost',
	'Skola',
	'Predmet',
	'PredmetRazrednogOdjeljenja',
	'Poteskoca',
	'VrstaPutnika',
	'Zanimanje',
	'Titula',
	'KategorijaOcjena',
	'SlobodnaAktivnost',
	'RazlogBoravista',
	'PredmetnaCjelina',
	'Ocjena',
	'DodijeljenaPoteskoca',
	'NastavnaJedinica',
	'MetodskaJedinica',
	'NastavniSat',
	'NajavaIspita',
	'Adresa',
	'Izostanak'
    ],
    
    // This function is called when application is initialized
    // and creates the default viewport
    launch: function() {
        console.log('Application launched!');
    }
});

// This function is called once the whole DOM has been loaded (that means html is finished rendering)
// Reference: http://dev.sencha.com/deploy/ext-4.0.0/docs/api/Ext.html#onReady
Ext.onReady(function() {
    // Load tooltip support
    Ext.QuickTips.init();
    
    // Load api providers
    Ext.app.REMOTING_API.enableBuffer = 100;
    Ext.direct.Manager.addProvider(Ext.app.REMOTING_API);
});