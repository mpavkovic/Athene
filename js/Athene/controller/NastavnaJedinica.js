Ext.define('Athene.controller.NastavnaJedinica', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nastavnajedinica.List',
        'nastavnajedinica.Form'
    ],
    
    stores: [
        'NastavnaJedinica',
        'NastavniPlan'
    ],
    
    models: [
        'NastavnaJedinica',
        'NastavniPlan'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nastavnajedinicagrid'
        }
    ],
    
    init: function() {
        console.log('Nastavna Jedinica controller initialized.')
        
        this.control({
            '#nastavnajedinicagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNastavnaJedinicaForm': {
                click: function() {
                    var view = Ext.widget('nastavnajedinicaform');
                    view.show();
                }
            }
        });
    },
    
    onGridRendered: function() {
        this.getNastavniPlanStore().load({
            scope: this,
            callback: function(records, operation, success) {
                if(success) {
                    this.getNastavnaJedinicaStore().load();
                } else {
                    Ext.widget('notification').popup({
                        message: 'Nemogu učitati nastavnu jedinicu!',
                        icon: 'img/icons/exclamation.png'
                    });
                    this.getWindow().close();
                }
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('nastavnajedinicaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#nastavnajedinicalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})