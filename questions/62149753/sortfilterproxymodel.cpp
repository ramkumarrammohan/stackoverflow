#include "sortfilterproxymodel.h"

SortFilterProxyModel::SortFilterProxyModel(QObject* parent) :
    QSortFilterProxyModel(parent)
{
    connect(this, &SortFilterProxyModel::searchStringChanged, this, &SortFilterProxyModel::invalidate); //
}

void SortFilterProxyModel::setSearchString(const QString &searchString)
{
    if (_searchString == searchString)
        return;

    _searchString = searchString;
    emit searchStringChanged(searchString); // connected with invalidateFilter, internally invalidateFilter makes call to filterAcceptsRow function
}

void SortFilterProxyModel::setSortOrder(const Qt::SortOrder &sortOrder)
{
    if(_sortOrder == sortOrder)
        return ;
    _sortOrder = sortOrder;
    sort(0, sortOrder);         // responsible call to make sorting, internally it will make a call to lessthan function
    emit sortOrderChanged(sortOrder);
}

bool SortFilterProxyModel::lessThan(const QModelIndex &source_left, const QModelIndex &source_right) const
{
    QVariant left = sourceModel()->data(source_left);
    QVariant right = sourceModel()->data(source_right);

    if(left.isValid() && right.isValid())
    {
        return left.toString() > right.toString();
    } else
    {
        return false;
    }
}

bool SortFilterProxyModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    QModelIndex index = sourceModel()->index(sourceRow, 0, sourceParent);
    QString data = sourceModel()->data(index, Qt::DisplayRole).value<QString>();

    if(_searchString.isEmpty() || _searchString.isNull())
        return true;

    if(data.contains(_searchString, Qt::CaseInsensitive))
        return true;

    return false;
}
