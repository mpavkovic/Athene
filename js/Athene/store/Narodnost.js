Ext.define('Athene.store.Narodnost', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Narodnost',
    proxy: {
        type: 'direct',
        directFn: Narodnost.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});