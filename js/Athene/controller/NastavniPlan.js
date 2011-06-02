Ext.define('Athene.controller.NastavniPlan', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nastavniplan.List',
        'nastavniplan.Form'
    ],
    
    stores: [
        'NastavniPlan'
    ],
    
    models: [
        'NastavniPlan'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nastavniplangrid'
        }
    ],
    
    init: function() {
        //console.log('Nastavni Plan controller initialized.')
        
        this.control({
            '#nastavniplangrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNastavniPlanForm': {
                click: function() {
                    var view = Ext.widget('nastavniplanform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getNastavniPlanStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('nastavniplanform');
        view.down('form').loadRecord(r);
        view.renderTo = '#nastavniplanlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getNastavniPlanStore().load();
    }
})