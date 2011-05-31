Ext.define('Athene.controller.PredmetnaCjelina', {
    extend: 'Ext.app.Controller',
    
    views: [
        'predmetnacjelina.List',
        'predmetnacjelina.Form'
    ],
    
    stores: [
        'PredmetnaCjelina'
    ],
    
    models: [
        'PredmetnaCjelina'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#predmetnacjelinagrid'
        }
    ],
    
    init: function() {
        //console.log('Predmetna Cjelina controller initialized.')
        
        this.control({
            '#predmetnacjelinagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openPredmetnaCjelinaForm': {
                click: function() {
                    var view = Ext.widget('predmetnacjelinaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('predmetnacjelinaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#predmetnacjelinalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})