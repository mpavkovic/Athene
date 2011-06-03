Ext.define('Athene.controller.Mjesto', {
    extend: 'Ext.app.Controller',
    
    views: [
        'mjesto.List',
        'mjesto.Form'
    ],
    
    stores: [
	'Drzava',
        'Mjesto'
    ],
    
    models: [
	'Drzava',
        'Mjesto'
    ],
    
    refs: [
        {
            ref: 'window',
            selector: '#mjestolist'
        },
        {
            ref: 'list',
            selector: '#mjestogrid'
        },
	{
	    ref: 'searchField',
	    selector: '#listMjestoSearch'
	}
    ],
    
    init: function() {	
        this.control({
            '#mjestogrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
	    'actioncolumn button': {
		click: this.edit
	    },
            '#openMjestoForm': {
                click: function() {
                    var view = Ext.widget('mjestoform');
                    view.show();
                }
            },
	    '#listMjestoSearch': {
		change: this.filterGrid
	    },
	    '#listMjestoClearFilter': {
		click: function() {
		    this.getSearchField().reset();
		}
	    },
	    '#helpMjestoList': {
                click: this.help
            },
	    'textfield': {
		specialkey: function(field, e) {
		    if(e.getKey() == e.ENTER) {
			//console.log('Submit here');
		    }
		}
	    }
        });
    },
    
    onGridRendered: function() {
        //Ext.widget('debugwindow').log('Mjesto grid rendered.');
        this.getMjestoStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },
    
    filterGrid: function(item, newValue, oldValue) {
	this.getList().store.clearFilter();
	this.getList().store.filter('naziv', newValue);
    },
    
    edit: function(v, r) {
        
        var view = Ext.widget('mjestoform', {
            title: 'Izmijeni: ' + r.data.naziv,
            modal: true
        });
        view.down('form').getForm().findField('drzava_id').store.load({
            callback: function() {
                view.down('form').loadRecord(r);
                view.down('#formMjestoSubmit').text = 'Spremi';
                view.renderTo = '#mjestolist';
                view.show();        
            }
        });
        
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/mjestolist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis mjesta');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})