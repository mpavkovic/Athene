Ext.define('Athene.store.Mjesto', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Mjesto',
    pageSize: 20,
    proxy: {
        type: 'direct',
        directFn: Mjesto.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'naziv'
        }
    ],
    totalProperty: 'total'
});