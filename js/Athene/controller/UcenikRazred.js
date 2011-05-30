Ext.define('Athene.controller.UcenikRazred', {
    extend: 'Ext.app.Controller',
    
    views: [
        'ucenikrazred.List',
        'ucenikrazred.Form'
    ],
    
    stores: [
        'UcenikRazred'
    ],
    
    models: [
        'UcenikRazred'
    ],
    
    refs: [
        {
            ref: 'list',
            selector: '#ucenikrazredgrid'
        }
    ],
    
    init: function() {
        console.log('UcenikRazred controller initialized.')
        
        this.control({
            '#ucenikrazredgrid': {
                render: this.onGridRendered,
                itemdblclick: this.edit
            },
            '#openUcenikRazredForm': {
                click: function() {
                    var view = Ext.widget('ucenikrazredform');
                    view.show();
                }
            },
            '#openUcenikRazredGrid': {
                click: function() {
                    Ext.widget('ucenikrazredlist').show();
                }
            },
            '#listUcenikRazredSearch': {
                change: this.filter
            },
            '#refreshUcenikRazredList': {
                click: this.refreshData
            }
        });
    },
    
    onGridRendered: function() {
        console.log('Grid is rendered, loading data...');
        this.getUcenikRazredStore().load({
            params: {
                start: 0,
                limit: 20
            }
        });
    }, 
    
    edit: function(v, r) {
        var view = Ext.widget('ucenikrazredform');
        view.down('form').loadRecord(r);
        view.renderTo = '#ucenikrazredlist';
        view.plain = true;
        view.modal = true; // Make window modal so the list is inacesible
        view.show();
    },
    
    filter: function(field, newValue, oldValue) {
        //console.log(value)
        this.getUcenikRazredStore().clearFilter(false);
        if(newValue != '') {
            this.getUcenikRazredStore().filter('prezime', newValue);
        }
        //console.log(new RegExp("^" + value, "i"));
    },
    
    refreshData: function() {
        this.getUcenikRazredStore().load();
    }
})