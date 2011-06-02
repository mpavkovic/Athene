Ext.define('Athene.controller.Skola', {
    extend: 'Ext.app.Controller',
    
    views: [
        'skola.List',
        'skola.Form'
    ],
    
    stores: [
        'Skola',
        'Mjesto'
    ],
    
    models: [
        'Skola',
        'Mjesto'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#skolagrid'
        }
    ],
    
    init: function() {
        //console.log('Skola controller initialized.')
        
        this.control({
            '#skolagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openSkolaForm': {
                click: function() {
                    var view = Ext.widget('skolaform');
                    view.show();
                }
            }
        });
    },
    
    
    /*onGridRendered: function() {
        this.getMjestoStore().load({
            scope: this,
            callback: function(records, operation, success) {
                if(success) {
                    this.getSkolaStore().load();
                } else {
                    Ext.widget('notification').popup({
                        message: 'Nemogu učitati popis škola!',
                        icon: 'img/icons/exclamation.png'
                    });
                    this.getWindow().close();
                }
            }
        });
    },*/
    onGridRendered: function() {
        //console.log('Grid is rendered, loading data...');
        this.getSkolaStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    },
    
    edit: function(v, r) {
        var view = Ext.widget('skolaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#skolalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    refreshData: function() {
        this.getSkolaStore().load();
    }
})