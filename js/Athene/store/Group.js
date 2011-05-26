Ext.define('Athene.store.Group', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Group',
    proxy: {
        type: 'direct',
        directFn: Group.getAll
    },
    sorters: [
        {
            property: 'name'
        }
    ],
    listeners: {
        load: function() {
            console.log('Loading data for Group store');
        }
    }
});