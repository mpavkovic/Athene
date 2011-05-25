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
        console.log('Predmet controller initialized.')
        
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
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getList().store.load();
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('predmetform');
        view.down('form').loadRecord(r);
        view.renderTo = '#predmetlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})