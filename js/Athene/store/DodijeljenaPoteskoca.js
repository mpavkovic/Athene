Ext.define('Athene.store.DodijeljenaPoteskoca', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.DodijeljenaPoteskoca',
    proxy: {
        type: 'direct',
        directFn: DodijeljenaPoteskoca.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: [
        {
            property: 'ucenik_id'
        }
    ]
});