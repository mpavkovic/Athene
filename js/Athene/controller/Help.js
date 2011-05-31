Ext.define('Athene.controller.Help', {
    extend: 'Ext.app.Controller',
    
    views: [
        'help.List',
        'help.Form'
    ],
    
    stores: [
        'Help'
    ],
    
    models: [
        'Help'
    ],
       
    init: function() {	
        this.control({
            '#helpgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openHelpForm': {
                click: function() {
                    Ext.widget('helpform').show();
                }
            },
	    /*'#listMjestoSearch': {
		change: this.filterGrid
	    },
	    '#listMjestoClearFilter': {
		click: function() {
		    this.getSearchField().reset();
		}
	    },*/
	    '#helpUserList': {
                click: this.help
            }
	    /*'textfield': {
		specialkey: function(field, e) {
		    if(e.getKey() == e.ENTER) {
			//console.log('Submit here');
		    }
		}
	    }*/
        });
    },
    
    onGridRendered: function() {
        this.getHelpStore().load();
    },
       
    edit: function(v, r) {
        var view = Ext.widget('helpform');
        view.down('form').loadRecord(r);
	view.down('#formHelpSubmit').text = 'Spremi';
	view.title = 'Izmijeni: ' + r.data.tag;
        view.renderTo = '#helplist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/helplist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis tema za pomoć');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})