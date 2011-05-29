Ext.define('Athene.store.Zanimanje', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Zanimanje',
    proxy: {
        type: 'direct',
        directFn: Zanimanje.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});