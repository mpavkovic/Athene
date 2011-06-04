Ext.define('Athene.controller.PredmetnaCjelina', {
    extend: 'Ext.app.Controller',
    
    views: [
        'predmetnacjelina.List',
        'predmetnacjelina.Form'
    ],
    
    stores: [
	'PredmetnaCjelina',
        'Predmet'
    ],
    
    models: [
	'PredmetnaCjelina',
        'Predmet'
    ],
    
    refs: [
        {
            ref: 'window',
            selector: '#predmetnacjelinalist'
        },
        {
            ref: 'list',
            selector: '#predmetnacjelinagrid'
        },
	{
	    ref: 'searchField',
	    selector: '#listPredmetnaCjelinaSearch'
	}
    ],
    
    init: function() {	
        this.control({
            '#predmetnacjelinagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
	    'actioncolumn button': {
		click: this.edit
	    },
            '#openPredmetnaCjelinaForm': {
                click: function() {
                    var view = Ext.widget('predmetnacjelinaform');
                    view.show();
                }
            },
	    '#listPredmetnaCjelinaSearch': {
		change: this.filterGrid
	    },
	    '#listPredmetnaCjelinaClearFilter': {
		click: function() {
		    this.getSearchField().reset();
		}
	    },
	    '#helpPredmetnaCjelinaList': {
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
        this.getPredmetnaCjelinaStore().load({
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
        
        var view = Ext.widget('predmetnacjelinaform', {
            title: 'Izmijeni: ' + r.data.naziv,
            modal: true
        });
        view.down('form').getForm().findField('predmet_id').store.load({
            callback: function() {
                view.down('form').loadRecord(r);
                view.down('#formPredmetnaCjelinaSubmit').text = 'Spremi';
                view.renderTo = '#predmetnacjelinalist';
                view.show();        
            }
        });
        
    },
    
    help: function() {
        Ext.Ajax.request({
            url: 'help/predmetnacjelinalist.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis predmetnih cjelina');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})