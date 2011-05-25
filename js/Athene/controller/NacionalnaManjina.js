Ext.define('Athene.controller.NacionalnaManjina', {
    extend: 'Ext.app.Controller',
    
    views: [
        'nacionalnamanjina.List',
        'nacionalnamanjina.Form'
    ],
    
    stores: [
        'NacionalnaManjina'
    ],
    
    models: [
        'NacionalnaManjina'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#nacionalnamanjinagrid'
        }
    ],
    
    init: function() {
        
        this.control({
            '#nacionalnamanjinagrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openNacionalnaManjinaForm': {
                click: function() {
                    var view = Ext.widget('nacionalnamanjinaform');
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
        var view = Ext.widget('nacionalnamanjinaform');
        view.down('form').loadRecord(r);
        view.renderTo = '#nacionalnamanjinalist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    }
})