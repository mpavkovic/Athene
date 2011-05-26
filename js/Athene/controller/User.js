Ext.define('Athene.controller.User', {
    extend: 'Ext.app.Controller',
    
    views: [
        'user.List',
        'user.Form'
    ],
    
    stores: [
        'User'
    ],
    
    models: [
        'User'
    ],
       
    init: function() {	
        this.control({
            '#usergrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
	    'actioncolumn button': {
		click: this.edit
	    },
            '#openUserForm': {
                click: function() {
                    var view = Ext.widget('userform');
                    view.show();
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
			console.log('Submit here');
		    }
		}
	    }*/
        });
    },
    
    onGridRendered: function() {
        this.getUserStore().load();
    },
       
    edit: function(v, r) {
        var view = Ext.widget('userform');
        view.down('form').loadRecord(r);
	view.down('#formUserSubmit').text = 'Spremi';
	view.title = 'Izmijeni: ' + r.data.naziv;
        view.renderTo = '#userlist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/userlist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis korisnika');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})