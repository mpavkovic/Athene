Ext.define('Athene.controller.Group', {
    extend: 'Ext.app.Controller',
    
    views: [
        'group.List',
        'group.Form'
    ],
    
    stores: [
        'Group'
    ],
    
    models: [
        'Group'
    ],
       
    init: function() {	
        this.control({
            '#groupgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openGroupForm': {
                click: function() {
                    Ext.widget('groupform').show();
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
	    '#helpGroupList': {
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
        this.getGroupStore().load();
    },
       
    edit: function(v, r) {
        var view = Ext.widget('groupform');
        view.down('form').loadRecord(r);
	view.down('#formGroupSubmit').text = 'Spremi';
	view.title = 'Izmijeni: ' + r.data.name;
        view.renderTo = '#grouplist';
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/grouplist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis grupa');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})