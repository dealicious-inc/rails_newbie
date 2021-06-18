import React from 'react'
import PropTypes from 'prop-types'
import Post from './Post'

const PostList = (props) => {
  const { items } = props

  return (
    <div>
      {items.map((item, index) => (
        <table>
          <Post key={index} id={item.id} title={item.title} body={item.body} />
        </table>
      ))}
    </div>
  )
}

PostList.propTypes = {
  items: PropTypes.array
}

export default PostList
