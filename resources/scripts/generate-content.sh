#!/usr/bin/env bash

start_time=`date +%s`

# Exit on any error.
set -e

if [ -z "$1" ]
then
    echo "ERROR: Please provide valid Drush alias. Exiting..."
    exit 1
fi

# Configurations.
tax_category_type='category'
tax_category_count=20
tax_forums_type='forums'
tax_forums_count=20
ct_event_type='event'
ct_event_count=50
ct_event_comments=20
ct_article_type='article'
ct_article_count=50
ct_article_comments=20
ct_forum_type='forum'
ct_forum_count=50
ct_forum_comments=200
ct_news_type='news'
ct_news_count=50
ct_news_comments=20

# Make sure relevant modules are enabled.
drush ${1} en devel_generate -y

# Starting counting time here - we want to measure only time spent on generating
# the content.
gen_start_time=`date +%s`

echo "INFO: Generating ${tax_category_count} terms in '${tax_category_type}' taxonomy."
drush ${1} gent ${tax_category_type} ${tax_category_count} --kill
echo "INFO: Generating ${tax_forums_count} terms in '${tax_forums_type}' taxonomy."
drush ${1} gent ${tax_forums_type} ${tax_forums_count} --kill

echo "INFO: Generating ${ct_article_count} nodes of type '${ct_article_type}' and ${ct_article_comments} comments."
drush ${1} genc ${ct_article_count} ${ct_article_comments} --kill --types=${ct_article_type}
echo "INFO: Generating ${ct_forum_count} nodes of type '${ct_forum_type}' and ${ct_forum_comments} comments."
drush ${1} genc ${ct_forum_count} ${ct_forum_comments} --kill --types=${ct_forum_type}
echo "INFO: Generating ${ct_news_count} nodes of type '${ct_news_type}' and ${ct_news_comments} comments."
drush ${1} genc ${ct_news_count} ${ct_news_comments} --kill --types=${ct_news_type}
echo "INFO: Generating ${ct_event_count} nodes of type '${ct_event_type}' and ${ct_event_comments} comments."
drush ${1} genc ${ct_event_count} ${ct_event_comments} --kill --types=${ct_event_type}

# Ending the countdown here - we want to measure only time spent on generating
# the content.
gen_end_time=`date +%s`

# Clean up.
echo "INFO: Cleaning up..."
drush ${1} dis devel_generate -y
drush ${1} cc all
drush ${1} cron

end_time=`date +%s`
echo ""
echo Execution time of content generation was `expr ${gen_end_time} - ${gen_start_time}`s.
echo Execution time of content generation and related tasks was `expr ${end_time} - ${start_time}`s.
