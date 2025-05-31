import React from 'react';
import ListItem from './ListItem';
import './ListContainer.css';

const ListContainer = ({ title, items, listNumber, onItemAction }) => {
  return (
    <div className="list-container">
      <h2>{title}</h2>
      <div className="list-scroll-container">
        {items.length === 0 ? (
          <p className="empty-text">No items in this list</p>
        ) : (
          items.map((item) => (
            <ListItem
              key={item.id}
              item={item}
              listNumber={listNumber}
              onItemAction={onItemAction}
            />
          ))
        )}
      </div>
    </div>
  );
};

export default ListContainer;
