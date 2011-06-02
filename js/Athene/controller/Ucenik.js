Ext.define('Athene.controller.Ucenik', {
    extend: 'Ext.app.Controller',
    
    views: [
        'ucenik.List',
        'ucenik.Form'
    ],
    
    stores: [
        'Ucenik'
    ],
    
    models: [
        'Ucenik'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#ucenikgrid'
        },
        {
            ref: 'searchField',
            selector: '#listUcenikSearch'
        }
    ],
    
    init: function() {
        //console.log('Ucenik controller initialized.')
        
        this.control({
            '#ucenikgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openUcenikForm': {
                click: function() {
                    var view = Ext.widget('ucenikform');
                    view.show();
                }
            },
            '#openUcenikGrid': {
                click: function() {
                    Ext.widget('uceniklist').show();
                }
            },
            '#listUcenikSearch': {
                change: this.filter
            },
            '#refreshUcenikList': {
                click: this.refreshData
            },
	    '#helpUcenik': {
                click: this.help
            },
            '#listUcenikClearFilter': {
		click: function() {
		    this.getSearchField().reset();
		}
	    }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getUcenikStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('ucenikform');
        view.down('form').loadRecord(r);
        view.renderTo = '#uceniklist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    filter: function(field, newValue, oldValue) {
        ////console.log(value)
        this.getUcenikStore().clearFilter(false);
        if(newValue != '') {
            this.getUcenikStore().filter('prezime', newValue);
        }
        ////console.log(new RegExp("^" + value, "i"));
    },
    
    refreshData: function() {
        this.getUcenikStore().load();
    },

    help: function() {
        Ext.Ajax.request({
            url: 'help/ucenici.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Popis učenika');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
})