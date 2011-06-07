Ext.define('Athene.store.Group', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Group',
    sorters: [
        {
            property: 'name'
        }
    ],
    listeners: {
        load: function() {
            //console.log('Loading data for Group store');
        }
    }
});