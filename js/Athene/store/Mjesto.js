Ext.define('Athene.store.Mjesto', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Mjesto',
    proxy: {
        type: 'direct',
        directFn: Mjesto.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});