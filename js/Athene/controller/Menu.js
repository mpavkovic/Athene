var regWindows = [
    'razredlist',
    'skgodlist',
    'uceniklist',
    'uciteljlist',
	'drzavalist',
	'mjestolist',
	'nacionalnamanjinalist',
	'nastavniplanlist',
	'dogadjajlist',
	'narodnostlist',
	'skolalist',
	'predmetlist',
	'predmetrazrednogodjeljenjalist',
	'poteskocalist',
	'vrstaputnikalist',
	'zanimanjalist',
	'titulalist',
	'kategorijaocjenalist',
	'slobodnaaktivnostlist',
	'razlogboravistalist',
	'predmetnacjelinalist',
	'ocjenalist',
	'dodijeljenapoteskocalist',
	'nastavnajedinicalist',
	'metodskajedinicalist',
	'nastavnisatlist',
	'najavaispitalist',
	'adresalist',
	'izostanaklist',
	'userlist'
];

Ext.define('Athene.controller.Menu', {
    extend: 'Ext.app.Controller',
    
    views: [
        'menu.Side'
    ],
    
    init: function() {
        
        this.control({
            'sidemenu': {
                itemclick: function(menu, record) {
                    if(record.data.leaf == true) {
                        _id = record.data.id;
                        _win = _id.substring(_id.lastIndexOf("/")+1);
                        if(!Ext.Array.contains(regWindows, _win)) {
                            Ext.Msg.alert("Error", "Unknown window id " + _win + ".");
                            return;
                        }
                        var view = Ext.WindowManager.get(_win);
                        if(view === undefined) {
                            view = Ext.widget(_win);
                            Ext.getCmp('workspace').add(view);
                            view.show();
                        }
                    }
                }
            }
        })
    }
});