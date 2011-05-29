Ext.define('Athene.store.Ocjena', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ocjena',
    proxy: {
        type: 'direct',
        directFn: Ocjena.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'ocjena'
        }
    ]
});