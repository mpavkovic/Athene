Ext.define('Athene.controller.Predmet', {
    extend: 'Ext.app.Controller',
    
    views: [
        'predmet.List',
        'predmet.Form'
    ],
    
    stores: [
        'Predmet'
    ],
    
    models: [
        'Predmet'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#predmetgrid'
        }
    ],
    
    init: function() {
        //console.log('Predmet controller initialized.')
        
        this.control({
            '#predmetgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openPredmetForm': {
                click: function() {
                    var view = Ext.widget('predmetform');
                    view.show();
                }
            },
			'#helpPredmet': {
                click: this.help
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getPredmetStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },  
    
    edit: function(v, r) {
        var view = Ext.widget('predmetform');
        view.down('form').loadRecord(r);
        view.renderTo = '#predmetlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },

    help: function() {
        Ext.Ajax.request({
            url: 'help/predmet.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Predmeti');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    },
    refreshData: function() {
        this.getPredmetStore().load();
    }
})