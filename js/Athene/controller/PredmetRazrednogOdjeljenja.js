Ext.define('Athene.controller.PredmetRazrednogOdjeljenja', {
    extend: 'Ext.app.Controller',
    
    views: [
        'predmetrazrednogodjeljenja.List',
        'predmetrazrednogodjeljenja.Form'
    ],
    
    stores: [
        'PredmetRazrednogOdjeljenja'
    ],
    
    models: [
        'PredmetRazrednogOdjeljenja'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#predmetrazrednogodjeljenjagrid'
        }
    ],
    
    init: function() {
        //console.log('PredmetRazrednogOdjeljenja controller initialized.')
        
        this.control({
            '#predmetrazrednogodjeljenjagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openPredmetRazrednogOdjeljenjaForm': {
                click: function() {
                    var view = Ext.widget('predmetrazrednogodjeljenjaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getPredmetRazrednogOdjeljenjaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('predmetrazrednogodjeljenjaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#predmetrazrednogodjeljenjalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getPredmetRazrednogOdjeljenjaStore().load();
    }
})